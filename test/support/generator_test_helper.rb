module GeneratorTestHelper
  def self.included(base)
    base.class_eval do
      destination File.expand_path("../../tmp", __FILE__)
      setup :prepare_destination
    end
  end

protected

  def prepare_destination
    rm_rf(destination_root)
    mkdir_p(destination_root + "/app")
    dummy_app = File.expand_path("../../dummy", __FILE__)
    FileUtils.cp_r(dummy_app + "/app/views", destination_root + "/app")
    FileUtils.cp_r(dummy_app + "/app/assets", destination_root + "/app")
  end
end
