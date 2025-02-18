require "test_helper"
require "generators/rails/bootstrap_scaffold/bootstrap_scaffold_generator"

class Rails::BootstrapScaffoldGeneratorTest < Rails::Generators::TestCase
  tests Rails::BootstrapScaffoldGenerator
  destination Rails.root.join("tmp/generators")
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
