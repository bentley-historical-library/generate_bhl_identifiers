This plugin is a slightly modified version of the generate_accession_identifiers plugin that ships with ArchivesSpace.
It autogenerates accession identifiers (the next sequential number) and resource identifiers (the current year followed by the next sequential three digit number)

The first time this is used, we'll need to initiate the sequences by posting the current high Accession and Resource values from BEAL to

	/repositories/:repo_id/plugins/generate_accession_identifiers, params={"value":current_value}
	/repositories/:repo_id/plugins/generate_resource_identifiers, params={"value":current_value}

To install, just activate the plugin in your config/config.rb file by
including an entry such as:

     AppConfig[:plugins] = ['generate_bhl_identifiers']
