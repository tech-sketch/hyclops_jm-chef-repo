name "fabric"
description "fabric role"
# env_run_lists "name" => ["recipe[name]"], "environment_name" => ["recipe[name::attribute]"]
# default_attributes()
# override_attributes "node" => { "attribute" => [ "value", "value", "etc." ] }
run_list(
  "recipe[fabric::install]"
)
