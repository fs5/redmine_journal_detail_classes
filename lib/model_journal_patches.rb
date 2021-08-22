require_dependency 'journal'

module ModelJournalPatches
  module PrependMethods
    def css_classes
      css_classes_with_patch
    end
  end
  def self.included(base)
    base.class_eval do
      include InstanceMethods
      alias_method :css_classes_without_patch, :css_classes
      prepend PrependMethods
    end
  end
  module InstanceMethods
    def css_classes_with_patch
      s = css_classes_without_patch
      if details.count == 1
        first_detail = details.first
        if first_detail.property == 'attr' && first_detail.prop_key == 'fixed_version_id'
          s << ' is-version-change'
        end
      end
      s
    end
  end
end

Journal.send(:include, ModelJournalPatches)
