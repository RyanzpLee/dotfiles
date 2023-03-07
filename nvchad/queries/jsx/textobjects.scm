;; extends
(object_pattern (_) @swappable)
((jsx_attribute (property_identifier) (_) @parameter.inner) @swappable)

(formal_parameters
  "," @_start .
  (_) @swappable
 (#make-range! "parameter.outer" @_start @swappable))
(formal_parameters
  . (_) @swappable
  . ","? @_end
 (#make-range! "parameter.outer" @swappable @_end))

