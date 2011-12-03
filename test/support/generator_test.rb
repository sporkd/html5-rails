require "rails/generators/test_case"

class GeneratorTest < Rails::Generators::TestCase
  destination File.expand_path("../../tmp", __FILE__)
  setup :prepare_destination

protected

  def prepare_destination
    rm_rf(destination_root)
    mkdir_p(destination_root + "/app")
    dummy_app = File.expand_path("../../dummy", __FILE__)
    FileUtils.cp_r(dummy_app + "/app/views", destination_root + "/app")
  end
end