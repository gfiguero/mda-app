require "test_helper"
require "generators/rails/scaffold_controller/scaffold_controller_generator"

class Rails::ScaffoldControllerGeneratorTest < Rails::Generators::TestCase
  tests Rails::ScaffoldControllerGenerator
  destination Rails.root.join("tmp/generators")
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
