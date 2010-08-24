# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{orange-more}
  s.version = "0.6.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Haslem"]
  s.date = %q{2010-08-24}
  s.description = %q{Orange is a Ruby framework for building managed websites with code as simple as Sinatra}
  s.email = %q{therabidbanana@gmail.com}
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    "lib/orange-more.rb",
     "lib/orange-more/administration.rb",
     "lib/orange-more/administration/assets/css/admin.css",
     "lib/orange-more/administration/assets/css/blueprint-ie.css",
     "lib/orange-more/administration/assets/css/blueprint-print.css",
     "lib/orange-more/administration/assets/css/blueprint.css",
     "lib/orange-more/administration/assets/js/jquery.js",
     "lib/orange-more/administration/base.rb",
     "lib/orange-more/administration/cartons/site.rb",
     "lib/orange-more/administration/cartons/site_carton.rb",
     "lib/orange-more/administration/cartons/user.rb",
     "lib/orange-more/administration/middleware/access_control.rb",
     "lib/orange-more/administration/middleware/site_load.rb",
     "lib/orange-more/administration/plugin.rb",
     "lib/orange-more/administration/resources/admin_resource.rb",
     "lib/orange-more/administration/resources/site_resource.rb",
     "lib/orange-more/administration/resources/user_resource.rb",
     "lib/orange-more/administration/templates/admin.haml",
     "lib/orange-more/administration/views/openid_login.haml",
     "lib/orange-more/administration/views/users/create.haml",
     "lib/orange-more/administration/views/users/edit.haml",
     "lib/orange-more/analytics.rb",
     "lib/orange-more/analytics/base.rb",
     "lib/orange-more/analytics/middleware/analytics.rb",
     "lib/orange-more/analytics/plugin.rb",
     "lib/orange-more/analytics/resources/analytics_resource.rb",
     "lib/orange-more/assets.rb",
     "lib/orange-more/assets/base.rb",
     "lib/orange-more/assets/cartons/asset_carton.rb",
     "lib/orange-more/assets/plugin.rb",
     "lib/orange-more/assets/resources/asset_resource.rb",
     "lib/orange-more/assets/views/assets/change.haml",
     "lib/orange-more/assets/views/assets/create.haml",
     "lib/orange-more/assets/views/assets/insert.haml",
     "lib/orange-more/blog.rb",
     "lib/orange-more/blog/base.rb",
     "lib/orange-more/blog/cartons/blog.rb",
     "lib/orange-more/blog/cartons/blog_post.rb",
     "lib/orange-more/blog/plugin.rb",
     "lib/orange-more/blog/resources/blog_post_resource.rb",
     "lib/orange-more/blog/resources/blog_resource.rb",
     "lib/orange-more/blog/views/blog/blog_archive_view.haml",
     "lib/orange-more/blog/views/blog/blog_offset_list_view.haml",
     "lib/orange-more/blog/views/blog/blog_post_view.haml",
     "lib/orange-more/blog/views/blog/sitemap_row.haml",
     "lib/orange-more/blog/views/blog_posts/edit.haml",
     "lib/orange-more/blog/views/blog_posts/show.haml",
     "lib/orange-more/cloud.rb",
     "lib/orange-more/cloud/base.rb",
     "lib/orange-more/cloud/plugin.rb",
     "lib/orange-more/cloud/resources/cloud_resource.rb",
     "lib/orange-more/contactforms.rb",
     "lib/orange-more/contactforms/assets/js/jquery.validate.pack.js",
     "lib/orange-more/contactforms/assets/js/lib/jquery-1.4.2.js",
     "lib/orange-more/contactforms/assets/js/lib/jquery.form.js",
     "lib/orange-more/contactforms/assets/js/lib/jquery.js",
     "lib/orange-more/contactforms/assets/js/lib/jquery.metadata.js",
     "lib/orange-more/contactforms/base.rb",
     "lib/orange-more/contactforms/cartons/contactform_carton.rb",
     "lib/orange-more/contactforms/plugin.rb",
     "lib/orange-more/contactforms/resources/contactforms_resource.rb",
     "lib/orange-more/contactforms/views/contactforms/contactform.haml",
     "lib/orange-more/debugger.rb",
     "lib/orange-more/debugger/assets/css/debug_bar.css",
     "lib/orange-more/debugger/base.rb",
     "lib/orange-more/debugger/middleware/debugger.rb",
     "lib/orange-more/debugger/plugin.rb",
     "lib/orange-more/debugger/views/debug_bar.haml",
     "lib/orange-more/disqus.rb",
     "lib/orange-more/disqus/base.rb",
     "lib/orange-more/disqus/plugin.rb",
     "lib/orange-more/disqus/resources/disqus_resource.rb",
     "lib/orange-more/disqus/views/disqus/comment_thread.haml",
     "lib/orange-more/news.rb",
     "lib/orange-more/news/base.rb",
     "lib/orange-more/news/cartons/news.rb",
     "lib/orange-more/news/plugin.rb",
     "lib/orange-more/news/resources/news_resource.rb",
     "lib/orange-more/news/views/news/archive.haml",
     "lib/orange-more/news/views/news/edit.haml",
     "lib/orange-more/news/views/news/latest.haml",
     "lib/orange-more/news/views/news/sitemap_row.haml",
     "lib/orange-more/pages.rb",
     "lib/orange-more/pages/base.rb",
     "lib/orange-more/pages/cartons/page_carton.rb",
     "lib/orange-more/pages/cartons/page_version_carton.rb",
     "lib/orange-more/pages/middleware/dumb_quotes.rb",
     "lib/orange-more/pages/plugin.rb",
     "lib/orange-more/pages/resources/page_resource.rb",
     "lib/orange-more/pages/views/pages/edit.haml",
     "lib/orange-more/pages/views/pages/show.haml",
     "lib/orange-more/sitemap.rb",
     "lib/orange-more/sitemap/assets/img/sitemap_down.png",
     "lib/orange-more/sitemap/assets/img/sitemap_down_d.png",
     "lib/orange-more/sitemap/assets/img/sitemap_indent.png",
     "lib/orange-more/sitemap/assets/img/sitemap_indent_d.png",
     "lib/orange-more/sitemap/assets/img/sitemap_outdent.png",
     "lib/orange-more/sitemap/assets/img/sitemap_outdent_d.png",
     "lib/orange-more/sitemap/assets/img/sitemap_up.png",
     "lib/orange-more/sitemap/assets/img/sitemap_up_d.png",
     "lib/orange-more/sitemap/assets/js/sitemap.js",
     "lib/orange-more/sitemap/base.rb",
     "lib/orange-more/sitemap/cartons/route.rb",
     "lib/orange-more/sitemap/middleware/flex_router.rb",
     "lib/orange-more/sitemap/plugin.rb",
     "lib/orange-more/sitemap/resources/sitemap_resource.rb",
     "lib/orange-more/sitemap/views/default_resource/sitemap_row.haml",
     "lib/orange-more/sitemap/views/sitemap/breadcrumb.haml",
     "lib/orange-more/sitemap/views/sitemap/list.haml",
     "lib/orange-more/sitemap/views/sitemap/one_level.haml",
     "lib/orange-more/sitemap/views/sitemap/route_actions.haml",
     "lib/orange-more/sitemap/views/sitemap/sitemap_links.haml",
     "lib/orange-more/sitemap/views/sitemap/table_row.haml",
     "lib/orange-more/sitemap/views/sitemap/two_level.haml",
     "lib/orange-more/slices.rb",
     "lib/orange-more/slices/base.rb",
     "lib/orange-more/slices/middleware/radius_parser.rb",
     "lib/orange-more/slices/plugin.rb",
     "lib/orange-more/slices/resources/radius.rb",
     "lib/orange-more/slices/resources/slices.rb"
  ]
  s.homepage = %q{http://github.com/therabidbanana/orange}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Plugins for Orange}
  s.test_files = [
    "spec/orange-core/application_spec.rb",
     "spec/orange-core/carton_spec.rb",
     "spec/orange-core/core_spec.rb",
     "spec/orange-core/magick_spec.rb",
     "spec/orange-core/middleware/base_spec.rb",
     "spec/orange-core/middleware/globals_spec.rb",
     "spec/orange-core/middleware/rerouter_spec.rb",
     "spec/orange-core/middleware/restful_router_spec.rb",
     "spec/orange-core/middleware/route_context_spec.rb",
     "spec/orange-core/middleware/route_site_spec.rb",
     "spec/orange-core/middleware/show_exceptions_spec.rb",
     "spec/orange-core/middleware/static_file_spec.rb",
     "spec/orange-core/middleware/static_spec.rb",
     "spec/orange-core/mock/mock_app.rb",
     "spec/orange-core/mock/mock_carton.rb",
     "spec/orange-core/mock/mock_core.rb",
     "spec/orange-core/mock/mock_middleware.rb",
     "spec/orange-core/mock/mock_mixins.rb",
     "spec/orange-core/mock/mock_model_resource.rb",
     "spec/orange-core/mock/mock_pulp.rb",
     "spec/orange-core/mock/mock_resource.rb",
     "spec/orange-core/mock/mock_router.rb",
     "spec/orange-core/orange_spec.rb",
     "spec/orange-core/packet_spec.rb",
     "spec/orange-core/resource_spec.rb",
     "spec/orange-core/resources/mapper_spec.rb",
     "spec/orange-core/resources/model_resource_spec.rb",
     "spec/orange-core/resources/parser_spec.rb",
     "spec/orange-core/resources/routable_resource_spec.rb",
     "spec/orange-core/spec_helper.rb",
     "spec/orange-core/stack_spec.rb",
     "spec/stats.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<orange-core>, [">= 0.5.7"])
      s.add_runtime_dependency(%q<dm-is-awesome_set>, [">= 0.11.0"])
      s.add_runtime_dependency(%q<dm-timestamps>, [">= 1.0.0"])
      s.add_runtime_dependency(%q<rack-openid>, [">= 0"])
      s.add_runtime_dependency(%q<openid_dm_store>, [">= 0"])
      s.add_runtime_dependency(%q<radius>, [">= 0"])
      s.add_runtime_dependency(%q<rest-client>, [">= 0"])
      s.add_runtime_dependency(%q<mail>, [">= 0"])
      s.add_runtime_dependency(%q<gattica>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rack-test>, [">= 0"])
    else
      s.add_dependency(%q<orange-core>, [">= 0.5.7"])
      s.add_dependency(%q<dm-is-awesome_set>, [">= 0.11.0"])
      s.add_dependency(%q<dm-timestamps>, [">= 1.0.0"])
      s.add_dependency(%q<rack-openid>, [">= 0"])
      s.add_dependency(%q<openid_dm_store>, [">= 0"])
      s.add_dependency(%q<radius>, [">= 0"])
      s.add_dependency(%q<rest-client>, [">= 0"])
      s.add_dependency(%q<mail>, [">= 0"])
      s.add_dependency(%q<gattica>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rack-test>, [">= 0"])
    end
  else
    s.add_dependency(%q<orange-core>, [">= 0.5.7"])
    s.add_dependency(%q<dm-is-awesome_set>, [">= 0.11.0"])
    s.add_dependency(%q<dm-timestamps>, [">= 1.0.0"])
    s.add_dependency(%q<rack-openid>, [">= 0"])
    s.add_dependency(%q<openid_dm_store>, [">= 0"])
    s.add_dependency(%q<radius>, [">= 0"])
    s.add_dependency(%q<rest-client>, [">= 0"])
    s.add_dependency(%q<mail>, [">= 0"])
    s.add_dependency(%q<gattica>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rack-test>, [">= 0"])
  end
end

