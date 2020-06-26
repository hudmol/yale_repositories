# Yale Repositories

This is an ArchivesSpace plugin that introduces extra location data to the
 repository model via a new subrecord `repository_location`.

This plugin was developed by Hudson Molonglo for Yale University.

# Getting Started

Download the latest release from the Releases tab in Github:

> https://github.com/hudmol/yale_repositories/releases

Unzip the release and move it to:

    /path/to/archivesspace/plugins

Unzip it:

    $ cd /path/to/archivesspace/plugins
    $ unzip yale_repositories-vX.X.zip

Enable the plugin by editing the file in `config/config.rb`:

    AppConfig[:plugins] = ['some_plugin', 'yale_repositories']

(Make sure you uncomment this line (i.e., remove the leading '#' if present))

Run the database migrations:

    $ cd /path/to/archivesspace
    $ ./scripts/setup_database.sh

# Configuration

* `AppConfig[:google_maps_api_key]` - Your Google API key with the Google Map Embed API enabled (required)
* `AppConfig[:libcal_service_id]` - Your libcal service ID (required)
* `AppConfig[:libcal_weeks_to_display]` - the number of weeks to display in the libcal table (optional, default: 18)
