# Visitor Analytics & Geographic Tracking Guide

This guide explains how to track where your website visitors are from and what analytics data you can access.

## 🎯 What You Can Track

With analytics enabled, you can see:
- **Geographic Location**: Countries, regions, cities
- **Traffic Sources**: How visitors found your site (search, direct, social media, etc.)
- **Popular Pages**: Which pages get the most visits
- **Visitor Behavior**: Time on site, pages per visit, bounce rate
- **Device Types**: Desktop, mobile, tablet
- **Browser & OS**: What browsers and operating systems visitors use
- **Time-based Data**: Peak visiting hours, days of week

## 🚀 Setup Google Analytics (Recommended)

### Step 1: Create Google Analytics Account

1. Go to [Google Analytics](https://analytics.google.com/)
2. Sign in with your Google account
3. Click **Start measuring**
4. Create an **Account** (e.g., "MoCA Lab")
5. Create a **Property** (e.g., "MoCA Lab Website")
6. Fill in property details:
   - Property name: `MoCA Lab Website`
   - Reporting time zone: `(UTC+02:00) Jerusalem`
   - Currency: `USD` (or your preference)
7. Click **Create**

### Step 2: Get Your Measurement ID

1. After creating the property, you'll see **Data Streams**
2. Click **Add stream** → **Web**
3. Enter:
   - Website URL: `https://moca-technion.github.io`
   - Stream name: `MoCA Lab Website`
4. Click **Create stream**
5. Copy your **Measurement ID** (format: `G-XXXXXXXXXX`)

### Step 3: Add to Your Website

1. Open `_config.yml`
2. Add your Measurement ID:
   ```yaml
   google_analytics: "G-XXXXXXXXXX"  # Replace with your actual ID
   ```
3. Save and commit the file
4. Push to GitHub (the analytics will start tracking automatically)

### Step 4: Verify It's Working

1. Visit your website: https://moca-technion.github.io
2. Go to Google Analytics → **Reports** → **Realtime**
3. You should see your visit appear within 30 seconds

## 📊 Accessing Geographic Data

### In Google Analytics:

1. **Go to Reports** → **User** → **Demographics** → **Demographics details**
   - See countries, cities, regions

2. **Go to Reports** → **User** → **Tech** → **Tech details**
   - See browsers, operating systems, devices

3. **Go to Reports** → **Acquisition** → **Traffic acquisition**
   - See how visitors found your site

4. **Go to Reports** → **Engagement** → **Pages and screens**
   - See most popular pages

### Geographic Reports Include:

- **Countries**: Top countries visiting your site
- **Cities**: Specific cities (if available)
- **Regions/States**: State/province level data
- **Continent**: High-level geographic grouping

## 🔍 Alternative: Google Search Console (Already Set Up)

You already have Google Search Console set up! It provides some geographic data:

1. Go to [Google Search Console](https://search.google.com/search-console)
2. Select your property: `https://moca-technion.github.io`
3. Go to **Performance** report
4. You can see:
   - Countries where searches came from
   - Search queries
   - Click-through rates
   - Impressions

**Note**: Search Console shows data about people who found you via Google Search, while Analytics shows ALL visitors.

## 📈 What Data You'll See

### Geographic Breakdown Example:
```
Top Countries:
1. Israel - 45% (450 visits)
2. United States - 30% (300 visits)
3. United Kingdom - 10% (100 visits)
4. Germany - 5% (50 visits)
5. Other - 10% (100 visits)
```

### Additional Insights:
- **Traffic Sources**: 
  - Organic search (Google, Bing)
  - Direct (typing URL)
  - Referral (other websites)
  - Social media
- **Popular Pages**:
  - Homepage
  - Projects page
  - Publications
- **Device Split**:
  - Desktop vs Mobile vs Tablet

## ⚙️ Privacy Considerations

The current analytics setup includes:
- ✅ IP anonymization (privacy-friendly)
- ✅ GDPR-compliant settings
- ✅ Cookie flags for security

## 🎯 Quick Setup Checklist

- [ ] Create Google Analytics account
- [ ] Create property for your website
- [ ] Get Measurement ID (G-XXXXXXXXXX)
- [ ] Add to `_config.yml`: `google_analytics: "G-XXXXXXXXXX"`
- [ ] Commit and push to GitHub
- [ ] Verify tracking in Google Analytics Realtime report
- [ ] Wait 24-48 hours for data to accumulate
- [ ] Check geographic reports in Analytics

## 📱 Mobile App Alternative

Google Analytics also has a mobile app:
- Download "Google Analytics" from App Store/Play Store
- View your data on the go
- Get notifications about traffic spikes

## 🔗 Useful Links

- [Google Analytics](https://analytics.google.com/)
- [Google Analytics Help](https://support.google.com/analytics)
- [Google Search Console](https://search.google.com/search-console) (already set up)

## 💡 Pro Tips

1. **Wait 24-48 hours** after setup for meaningful data
2. **Check regularly** - data updates in real-time but reports refresh daily
3. **Set up goals** - Track specific actions (e.g., contact form submissions)
4. **Create custom reports** - Focus on metrics that matter to you
5. **Compare time periods** - See trends over time

## 🆘 Troubleshooting

**Not seeing data?**
- Wait 24-48 hours (data needs time to accumulate)
- Check that Measurement ID is correct in `_config.yml`
- Verify the analytics script is loading (check page source)
- Check browser console for errors

**Data seems low?**
- Remember: Analytics only tracks from when you enable it
- Some visitors may use ad blockers (which block analytics)
- Data is anonymized and aggregated

