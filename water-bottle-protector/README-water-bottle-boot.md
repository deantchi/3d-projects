# 40oz Bottle Bottom Protector (PETG)

OpenSCAD file: `water-bottle-boot-40oz.scad`

## Quick fit tuning
- Measure your bottle base diameter with calipers.
- Set `inner_diameter` to the measured value.
- Keep `fit_clearance`:
  - 0.6 mm for snug fit
  - 0.8 mm balanced (default)
  - 1.0 mm easy on/off

## Suggested PETG print settings
- Layer height: 0.20 mm
- Walls/perimeters: 4
- Top/bottom layers: 5
- Infill: 20% gyroid
- Nozzle: 0.4 mm
- Bed: 75-85C
- Nozzle temp: 235-250C (per filament)
- Print orientation: upright (open side up)

## Export STL
If OpenSCAD is installed:

```bash
openscad -o water-bottle-boot-40oz.stl water-bottle-boot-40oz.scad
```

## Notes
- Typical 40oz insulated bottles vary by brand (roughly 91-95 mm base).
- If it is too tight, increase `fit_clearance` by +0.2 mm.
- If it slips too easily, reduce `fit_clearance` by -0.2 mm.
