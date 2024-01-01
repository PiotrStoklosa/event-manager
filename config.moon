import config from require "lapis.config"

config "development", ->
  mysql ->
    host "127.0.0.1"
    user "root"
    password "my-secret-pw"
    database "events"

config "development", ->
  server "nginx"
  code_cache "off"
  num_workers "1"
