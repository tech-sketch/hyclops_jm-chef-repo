name "jobscheduler-engine"
description "JobScheduler Engine for HyClops JobMonitoring"
# env_run_lists "name" => ["recipe[name]"], "environment_name" => ["recipe[name::attribute]"]
# override_attributes(
# override_attributes(
default_attributes(
  "java" => {
    "install_flavor" => "oracle",
    "jdk_version" => 7,
    "oracle" => {
      "accept_oracle_download_terms" => true
    }
  },
  "postgresql" => {
    "enable_pgdg_yum" => true
  }
)
run_list([
"recipe[java]",
"recipe[jobscheduler::engine_install]"
])
