### SIBLING

{{% bannerNote type="code" %}}
quadkey.SIBLING(quadint, direction)
{{%/ bannerNote %}}

**Description**

Returns the quadint directly next to the given quadint at the same zoom level. The direction must be sent as argument and currently only horizontal/vertical movements are allowed.

* `quadint`: `INT64` quadint to get the sibling from.
* `direction`: `STRING` <code>'right'|'left'|'up'|'down'</code> direction to move in to extract the next sibling. 

**Return type**

`INT64`

**Example**

```sql
SELECT bqcarto.quadkey.SIBLING(4388, 'up');
-- 3876
```