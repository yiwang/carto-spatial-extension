## constructors

<div class="badge core"></div>

This module contains functions that create geographies from coordinates or already existing geographies.

### ST_MAKEENVELOPE

{{% bannerNote type="code" %}}
constructors.ST_MAKEENVELOPE(xmin, ymin, xma, ymax)
{{%/ bannerNote %}}

**Description**
Creates a rectangular Polygon from the minimum and maximum values for X and Y.


* `xmin`: `FLOAT64` minimum value for X.
* `ymin`: `FLOAT64` minimum value for Y.
* `xmax`: `FLOAT64` maximum value for X.
* `ymax`: `FLOAT64` maximum value for Y.

**Return type**

`GEOGRAPHY`

**Example**

``` sql
SELECT bqcarto.constructors.ST_MAKEENVELOPE(0,0,1,1);
-- POLYGON((1 0, 1 1, 0 1, 0 0, 1 0)) 
```

### ST_TILEENVELOPE

{{% bannerNote type="code" %}}
constructors.ST_TILEENVELOPE(zoomLevel, xTile, yTile)
{{%/ bannerNote %}}

**Description**
Returns the boundary polygon of a tile given its zoom level and its X and Y indices.

* `zoomLevel`: `INT64` zoom level of the tile.
* `xTile`: `INT64` X index of the tile.
* `yTile`: `INT64` Y index of the tile.

**Return type**

`GEOGRAPHY`

**Example**

``` sql
SELECT bqcarto.constructors.ST_TILEENVELOPE(10,384,368);
-- POLYGON((-45 45.089035564831, -45 44.840290651398, -44.82421875 44.840290651398, -44.6484375 44.840290651398, -44.6484375 45.089035564831, -44.82421875 45.089035564831, -45 45.089035564831))
```

### VERSION

{{% bannerNote type="code" %}}
constructors.VERSION()
{{%/ bannerNote %}}

**Description**

Returns the current version of the constructors module.

**Return type**

`STRING`

**Example**

```sql
SELECT bqcarto.constructors.VERSION();
-- 1.0.0
```