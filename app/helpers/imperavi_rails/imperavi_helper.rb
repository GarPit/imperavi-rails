module ImperaviRails
  module ImperaviHelper
    include ActionView::Helpers::AssetTagHelper

    def imperavi_stylesheet_path(source)
      stylesheet_path("imperavi-rails/imperavi/#{source}")
    end

    def imperavi_javascript_path(source)
      javascript_path("imperavi-rails/#{source}")
    end

    def include_imperavi_stylesheet
      stylesheet_link_tag imperavi_stylesheet_path('redactor')
    end

    def include_imperavi_javascript
      javascript_include_tag imperavi_javascript_path('imperavi')
    end

    def imperavi(element, options = {}, wrap = true)
      result = %Q(
        $(document).ready(function() {
          document.#{element}_redactor = $('##{element}').redactor(#{imperavi_options(options).to_json});
        });
      )

      raw(wrap ? "<script>#{result}</script>" : result)
    end

    def imperavi_options(options)
      merged_opt = imperavi_default_options.deep_merge!(options)
      imperavi_default_paths(merged_opt).deep_merge!(options)
    end

    def imperavi_default_options
      {
        :air                 => false,
        :autosave            => false,
        :interval            => 20,   
        :resize              => true,
        :visual              => true,
        :focus               => false,
        :lang                => 'en',
        :toolbar             => 'main',
        :autoclear           => true,
        :removeClasses       => false,
        :removeStyles        => true,
        :convertLinks        => true,
        :autoformat          => true,
        :clearOnInit         => false,
        :overlay             => true, 
        :fileUploadCallback  => false,
        :imageUploadCallback => false,
      }
    end

    def imperavi_default_paths(base_options)
      {
        # Paths to various handlers
        :paths => {
          # Editor css
          :stylesheets => [imperavi_stylesheet_path('wym')],

          # Toolbar
          :toolbar => imperavi_rails.toolbar_path(base_options[:toolbar], :format => :js),

          # Interface translations
          :language =>  imperavi_rails.language_path(base_options[:lang], :format => :js),

          # Typograf
          :typograf => imperavi_rails.typograf_path,

          # Dialogs
          # TODO Add dialogs sizes
          :dialogs => {
            :file      => imperavi_rails.file_path,
            :fileEdit  => imperavi_rails.file_edit_path,
            :image     => imperavi_rails.image_path,
            :imageEdit => imperavi_rails.image_edit_path,
            :link      => imperavi_rails.link_path,
            :table     => imperavi_rails.table_path,
            :video     => imperavi_rails.video_path,
          },

          # Images
          :images => {
            :upload   => '',#'/imperavi/images',
            :download => '',#'/imperavi/images/777',
            :list     => '',#'/imperavi/images.json'
          },

          # Files
          :files => {
            :upload   => '',#'/imperavi/files',
            :download => '',#'/imperavi/files/777', # /tests/file_download.php?file=
            :remove   => '',#'/imperavi/files/777'  # /tests/file_delete.php?delete=
          }
        }
      }
    end
  end
end
