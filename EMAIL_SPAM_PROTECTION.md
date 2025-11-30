# Email Spam Protection Status

This document tracks where emails are displayed and their spam protection status.

## ✅ Protected (Obfuscated)

### 1. **Email Buttons** (`_includes/email-button.html`)
- **Location**: Project pages, Join page
- **Protection**: ✅ JavaScript-based obfuscation
- **Display**: Shows email address as button text after JavaScript loads
- **Fallback**: `<noscript>` shows email (necessary for accessibility)

### 2. **Email Links** (`_includes/email-obfuscate.html`)
- **Location**: Contact page, People pages, Person layout
- **Protection**: ✅ JavaScript-based obfuscation
- **Display**: Shows email address after JavaScript loads
- **Fallback**: `<noscript>` shows email (necessary for accessibility)

### 3. **SEO Structured Data** (`_includes/seo.html`)
- **Location**: JSON-LD in HTML `<head>`
- **Protection**: ✅ Obfuscated as `user[at]domain.com`
- **Note**: Search engines can still parse this, but reduces bot scraping

### 4. **humans.txt**
- **Location**: `/humans.txt`
- **Protection**: ✅ Obfuscated as `user[at]domain.com`
- **Note**: Less commonly scraped by bots

## ⚠️ Partially Protected

### 1. **security.txt** (`.well-known/security.txt`)
- **Location**: `/well-known/security.txt`
- **Protection**: ⚠️ Plain email (required by standard)
- **Reason**: The security.txt standard requires a valid `mailto:` link
- **Risk**: Low - security.txt is less commonly scraped
- **Note**: This file is for security researchers, so exposure is somewhat intentional

### 2. **Noscript Fallbacks**
- **Location**: All email includes
- **Protection**: ⚠️ Plain email in HTML
- **Reason**: Required for accessibility (users without JavaScript)
- **Risk**: Medium - bots can see it, but necessary for accessibility
- **Note**: Most modern bots run JavaScript anyway, so this is a necessary trade-off

## 📁 Source Files (Not Public)

These files contain plain emails but are **not publicly accessible**:
- `_data/site.json` - Jekyll data file (not in public HTML)
- `_data/people.yml` - Jekyll data file (not in public HTML)
- `_people/*.md` - Jekyll collection files (not in public HTML)

## 🛡️ Protection Strategy

### Current Approach:
1. **JavaScript Obfuscation**: Email split into parts, reconstructed by JS
2. **Placeholder Text**: Shows `user[at]domain.com` before JS loads
3. **Accessibility Fallback**: `<noscript>` tag for users without JS
4. **SEO Obfuscation**: Structured data uses `[at]` format

### Effectiveness:
- ✅ **Blocks simple scrapers** that don't run JavaScript
- ✅ **Reduces automated harvesting** from HTML source
- ⚠️ **Advanced bots** that run JavaScript can still extract emails
- ⚠️ **Noscript fallbacks** are visible to all bots (but necessary for accessibility)

## 📊 Risk Assessment

| Location | Protection Level | Risk | Notes |
|----------|-----------------|------|-------|
| Email Buttons | High | Low | JavaScript obfuscation + noscript fallback |
| Email Links | High | Low | JavaScript obfuscation + noscript fallback |
| SEO Data | Medium | Medium | Obfuscated but in structured format |
| humans.txt | Medium | Low | Obfuscated, less commonly scraped |
| security.txt | None | Low | Required by standard, less commonly scraped |
| Noscript | None | Medium | Necessary for accessibility |

## 🔧 Additional Recommendations

1. **Consider CAPTCHA**: For contact forms (if you add one)
2. **Email Aliases**: Use different email addresses for different purposes
3. **Spam Filters**: Ensure your email provider has good spam filtering
4. **Monitor**: Check spam levels and adjust if needed

## 📝 Notes

- **Accessibility vs. Protection**: There's a trade-off between spam protection and accessibility. The current approach prioritizes accessibility (noscript fallbacks) while still providing protection.
- **JavaScript Required**: Most protection relies on JavaScript. Users/bots without JS will see the email, but this is necessary for accessibility.
- **Security.txt**: This file intentionally exposes contact info for security researchers, so some exposure is expected and acceptable.

