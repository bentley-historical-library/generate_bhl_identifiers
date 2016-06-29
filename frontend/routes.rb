ArchivesSpace::Application.routes.draw do

  match('/plugins/generate_accession_identifier/generate' => 'generate_accession_identifiers#generate',
        :via => [:post])

  match('/plugins/generate_resource_identifier/generate' => 'generate_resource_identifiers#generate',
  		:via => [:post])

end
