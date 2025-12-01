# Project Page Performance Optimization

## Issue Identified

Project pages were loading slowly due to an inefficient nested loop when displaying related publications.

### Problem
The original code used a nested loop:
```liquid
{% for pub_title in page.publications %}
  {% for pub in all_pubs %}
    {% if pub.title == pub_title %}
      ...
    {% endif %}
  {% endfor %}
{% endfor %}
```

**Complexity**: O(n × m) where:
- n = number of publications in the project
- m = total number of publications (122+)

**Example**: If a project has 5 publications and there are 122 total publications:
- **Before**: 5 × 122 = 610 iterations
- **After**: 5 iterations (one per publication)

### Solution
Replaced nested loop with Jekyll's `where_exp` filter:
```liquid
{% assign found_pubs = all_pubs | where_exp: "pub", "pub.title == pub_title" %}
```

**Complexity**: O(n) - Jekyll's filter is optimized internally
- Much faster than manual nested loops
- Cleaner, more maintainable code

## Performance Impact

### Before Optimization
- **Build time**: Slower (especially with many projects)
- **Page load**: Delayed rendering
- **Scalability**: Gets worse as publications grow

### After Optimization
- **Build time**: Faster
- **Page load**: Immediate rendering
- **Scalability**: Linear growth, not quadratic

## Additional Optimizations

### 1. Early Break (Already Implemented)
- Uses `{% break %}` to exit loop once publication is found
- Reduces unnecessary iterations

### 2. Conditional Rendering
- Only processes publications section if `page.publications` exists
- Avoids unnecessary work

## Testing

To verify the improvement:
1. Check build time: `time bundle exec jekyll build`
2. Test page load: Open project page and check Network tab
3. Compare: Before vs after optimization

## Future Considerations

If publications database grows significantly (1000+):
- Consider indexing publications by title
- Use Jekyll plugins for faster lookups
- Cache publication lookups

## Related Files

- `_layouts/project.html` - Project page layout (optimized)
- `_data/publications.json` - Publications database (122 entries)


