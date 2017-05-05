module SimplehrRecruitment
  class Engine < ::Rails::Engine
    if defined?(ActsAsPluggable)
      ::ActsAsPluggable::Plugin.register(
        :karmahrm_recruitment,
        :collaboration, engine: self,
                        description: 'Recruitment Plugin',
                        website: 'https://github.com/tachyons/simplehr_discussion',
                        author: 'Sobin Sunny',
                        version: SimplehrRecruitment::VERSION,
                        settings: {
                          display_in_topbar: true
                        },
                        menu: {
                          url: {
                            controller: :posts,
                            action: :index
                          },
                          class: 'fa fa-recruitment',
                          submenus: [
                            {
                              text: 'New',
                              class: 'fa fa-new',
                              url: { controller: :recruitments, action: :new }
                            },
                            {
                              text: 'Index',
                              class: 'fa fa-index',
                              url: { controller: :recruitments, action: :index }
                            }
                          ],
                          text: 'Recruitment'
                        })
    end
    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths['db/migrate'].expanded.each do |expanded_path|
          app.config.paths['db/migrate'] << expanded_path
        end
      end
    end
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
    config.active_record.observers ||= []
  end
end
