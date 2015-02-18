require_relative '../phase2/controller_base'
require 'active_support'
require 'active_support/core_ext'
require 'erb'

module Phase3
  class ControllerBase < Phase2::ControllerBase
    # use ERB and binding to evaluate templates
    # pass the rendered html to render_content
    def render(template_name)
      path = File.dirname(__FILE__)
      template_filename = File.join(path, "..", "..","views", self.class.name.underscore, "#{template_name}.html.erb")
      template_code = File.read(template_filename)
      render_content(ERB.new(template_code).result(binding),"text/html")
    end
  end
end
