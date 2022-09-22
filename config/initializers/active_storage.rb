# when editing entries with (has many) photos attached this prevents purge of photos after edit
# if photos exist? new photos will be added to the existing ones, if no photo is selected, previous picture persist.
# this file is effective both in dev and prod via config/initializers/active_storage.rb
# if you want to disable / enable this rule only in either dev or prod add the line below in config/environments/development.rb
# or production.rb respectively and delete this file.
# config.active_storage.replace_on_assign_to_many = false

Rails.application.config.active_storage.replace_on_assign_to_many = false
