# Module that can be included (mixin) to take and output Yaml data

# Transforms hashes to YAML and viceversa
module YamlBuddy
  require 'yaml'
  def take_yaml(input_yaml)
    @data = YAML.load(input_yaml)
  end

  def to_yaml
    data.to_yaml
  end
end
