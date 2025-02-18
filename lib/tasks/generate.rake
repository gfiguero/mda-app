Dir[Rails.root.join('lib/scripts/*.rb')].each { |file| require file }

namespace :mda do
  desc 'Generate scaffolds for mda project'
  task generate: :environment do
    puts 'Starting mda:generate task...'

    #    scaffolds = %w[InspectionScaffold InsuranceCompanyScaffold MedicalLicenseScaffold AgentScaffold EmployeeScaffold EmploymentConditionScaffold HealthAuditScaffold]
    scaffolds = %w[EmployeeScaffold]

    scaffolds.each do |scaffold|
      puts "Generating #{scaffold}..."
      system(Object.const_get("#{scaffold}").new.generate_command)
    end

    puts 'Finished mda:generate task!'
  end
end
