Dir[Rails.root.join('lib/scripts/*.rb')].each { |file| require file }

namespace :mda do
  desc 'Destroy scaffolds for mda project'
  task destroy: :environment do
    puts 'Starting mda:destroy task...'

    scaffolds = %w[InspectionScaffold InsuranceCompanyScaffold MedicalLicenseScaffold AgentScaffold EmployeeScaffold EmploymentConditionScaffold HealthAuditScaffold]

    scaffolds.each do |scaffold|
      puts "Destroying #{scaffold}..."
      system(Object.const_get("#{scaffold}").new.destroy_command)
    end

    puts 'Finished mda:destroy task!'
  end
end
