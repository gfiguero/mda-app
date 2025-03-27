# frozen_string_literal: true

require "rails/generators/erb"
require "rails/generators/resource_helpers"

module Erb
  module Generators
    class ScaffoldGenerator < Base
      include Rails::Generators::ResourceHelpers

      # source_root File.expand_path("../templates", __FILE__)

      argument :attributes, type: :array, default: [], banner: "field:type field:type"

      def create_root_folder
        empty_directory File.join("app/views", controller_file_path)
      end

      def copy_view_files
        available_views.each do |view|
          formats.each do |format|
            filename = filename_with_extensions(view, format)
            template filename, File.join("app/views", controller_file_path, filename)
          end
        end

        template "partial.html.erb", File.join("app/views", controller_file_path, "_#{singular_name}.html.erb")
        template "partial_row.html.erb", File.join("app/views", controller_file_path, "_#{singular_name}_row.html.erb")
      end

      private

      def available_views
        %w[index edit show new _table _form _filter _buttons]
      end
    end
  end
end
