module Jekyll
  module DateParser
    def self.parse_date(date_str)
      return nil if date_str.nil?
      
      date_str = date_str.to_s.strip.gsub(/^["']|["']$/, '') # Remove quotes
      
      # Handle YYYY-MM-DD format
      if date_str.match?(/^\d{4}-\d{2}-\d{2}$/)
        begin
          return Date.parse(date_str)
        rescue
          return nil
        end
      end
      
      # Handle YYYY-MM format (month-only)
      if date_str.match?(/^\d{4}-\d{2}$/)
        # Parse as first day of the month
        begin
          return Date.parse("#{date_str}-01")
        rescue
          return nil
        end
      end
      
      # Try standard parsing
      begin
        return Date.parse(date_str)
      rescue
        return nil
      end
    end
    
    def self.is_month_only(date_str)
      return false if date_str.nil?
      date_str = date_str.to_s.strip.gsub(/^["']|["']$/, '')
      date_str.match?(/^\d{4}-\d{2}$/)
    end
    
    def self.extract_date_from_file(file_path)
      return nil unless file_path && File.exist?(file_path)
      
      begin
        file_content = File.read(file_path, encoding: 'UTF-8')
        # Match front matter with multiline regex
        if file_content =~ /^---\s*\n(.*?)\n---\s*\n/m
          front_matter = $1
          # Match date: "2025-10" or date: '2025-10' or date: 2025-10
          if front_matter =~ /date:\s*["']([^"']+)["']/ || front_matter =~ /date:\s*(\d{4}-\d{2}(?:-\d{2})?)/
            original_date_str = ($1 || $2).strip
            return original_date_str if is_month_only(original_date_str)
          end
        end
      rescue => e
        Jekyll.logger.warn "DateParser: Error reading #{file_path}: #{e.message}"
      end
      
      nil
    end
  end
  
  # Override Jekyll::Utils.parse_date to handle month-only dates
  module Utils
    class << self
      alias_method :original_parse_date, :parse_date
      
      def parse_date(input, format = nil)
        # If it's a string and looks like YYYY-MM (month-only), handle it
        if input.is_a?(String)
          date_str = input.strip.gsub(/^["']|["']$/, '')
          if DateParser.is_month_only(date_str)
            parsed = DateParser.parse_date(date_str)
            return parsed if parsed
          end
        end
        
        # Otherwise, use original method
        original_parse_date(input, format)
      end
    end
  end
  
  # Hook into documents after initialization to extract original date
  Jekyll::Hooks.register :documents, :post_init do |doc|
    next unless doc.data.key?('date')
    next if doc.data.key?('date_original') # Already processed
    
    # Only process news collection documents
    next unless doc.collection && doc.collection.label == 'news'
    
    # Check if date is the 1st of the month (likely from month-only format)
    date_value = doc.data['date']
    is_first_of_month = false
    
    if date_value.is_a?(Date)
      is_first_of_month = (date_value.day == 1)
    elsif date_value.is_a?(Time)
      is_first_of_month = (date_value.day == 1)
    end
    
    # Always try to read the file for news items (not just 1st of month)
    # Try to get the file path using multiple methods
    file_path = nil
    
    # Method 1: Use doc.path if available (absolute path)
    if doc.respond_to?(:path) && doc.path && File.exist?(doc.path)
      file_path = doc.path
    end
    
    # Method 2: Build path from site source and relative_path
    if !file_path && doc.respond_to?(:relative_path) && doc.relative_path
      site = Jekyll.sites.first
      if site && site.source
        candidate_path = File.join(site.source, doc.relative_path)
        file_path = candidate_path if File.exist?(candidate_path)
      end
    end
    
    # Method 3: Try _news directory directly using basename
    if !file_path
      site = Jekyll.sites.first
      if site && site.source
        # Try to get basename from various methods
        basename = nil
        if doc.respond_to?(:basename_without_ext)
          basename = doc.basename_without_ext
        elsif doc.respond_to?(:basename)
          basename = doc.basename.sub(/\.[^.]+$/, '')
        elsif doc.data['slug']
          basename = doc.data['slug']
        end
        
        if basename
          candidate_path = File.join(site.source, '_news', "#{basename}.md")
          file_path = candidate_path if File.exist?(candidate_path)
        end
      end
    end
    
    # Method 4: Try all files in _news directory and match by slug or title
    if !file_path
      site = Jekyll.sites.first
      if site && site.source
        news_dir = File.join(site.source, '_news')
        if Dir.exist?(news_dir)
          Dir.glob(File.join(news_dir, '*.md')).each do |candidate|
            begin
              content = File.read(candidate, encoding: 'UTF-8')
              if content =~ /^---\s*\n(.*?)\n---\s*\n/m
                fm = $1
                # Check if slug or title matches
                slug_match = (doc.data['slug'] && fm.include?("slug: #{doc.data['slug']}"))
                title_match = (doc.data['title'] && fm.include?(doc.data['title']))
                if slug_match || title_match
                  file_path = candidate
                  break
                end
              end
            rescue
              next
            end
          end
        end
      end
    end
    
    if file_path && File.exist?(file_path)
      original_date = DateParser.extract_date_from_file(file_path)
      if original_date
        doc.data['date_original'] = original_date
        doc.data['date_month_only'] = true
        Jekyll.logger.debug "DateParser: Found month-only date #{original_date} in #{file_path}"
      else
        Jekyll.logger.debug "DateParser: No month-only date found in #{file_path}"
      end
    else
      Jekyll.logger.debug "DateParser: File not found for doc #{doc.data['title'] || 'unknown'}"
    end
  end
  
  # Also hook into pages for consistency
  Jekyll::Hooks.register :pages, :post_init do |page|
    next unless page.data.key?('date')
    next if page.data.key?('date_original')
    next unless page.path && File.exist?(page.path)
    
    date_value = page.data['date']
    is_first_of_month = false
    
    if date_value.is_a?(Date)
      is_first_of_month = (date_value.day == 1)
    elsif date_value.is_a?(Time)
      is_first_of_month = (date_value.day == 1)
    end
    
    if is_first_of_month
      original_date = DateParser.extract_date_from_file(page.path)
      if original_date
        page.data['date_original'] = original_date
        page.data['date_month_only'] = true
      end
    end
  end
end
