# People Photos Directory

Place photos for lab members in this directory.

## How to Add Photos

### For the PI (Principal Investigator):

1. Place the photo file in this directory (e.g., `rui-yao.jpg`)
2. Update `_data/site.json` with the photo path:
   ```json
   {
     "pi_photo": "/assets/img/people/rui-yao.jpg"
   }
   ```

### For Lab Members:

1. Place the photo file in this directory (e.g., `jane-doe.jpg`)
2. Update `_data/people.yml` with the photo path:
   ```yaml
   - name: Jane Doe
     role: Ph.D. Student
     photo: /assets/img/people/jane.jpg
   ```

## Photo Guidelines

- **Recommended size**: Square format (e.g., 400x400px or 500x500px)
- **Supported formats**: JPG, PNG, WebP
- **File naming**: Use lowercase, hyphens for spaces (e.g., `jane-doe.jpg`, `rui-yao.jpg`)
- **File size**: Keep under 500KB for faster loading

## Example File Structure

```
assets/img/people/
  ├── rui-yao.jpg        # PI photo
  ├── jane-doe.jpg      # Lab member photo
  └── john-smith.jpg    # Another lab member photo
```

