# load all lessons
load './db/fixtures/lessons/foundation_lessons.rb'
load './db/fixtures/lessons/ruby_lessons.rb'
load './db/fixtures/lessons/database_lessons.rb'
load './db/fixtures/lessons/ruby_on_rails_lessons.rb'
load './db/fixtures/lessons/html_and_css_lessons.rb'
load './db/fixtures/lessons/javascript_lessons.rb'
load './db/fixtures/lessons/react_lessons.rb'
load './db/fixtures/lessons/getting_hired_lessons.rb'
load './db/fixtures/lessons/node_js_lessons.rb'
load './db/fixtures/lessons/git_lessons.rb'
load './db/fixtures/lessons/shared_lessons.rb'

Rails::Generators.invoke('seed_uuids') if Rails.env.development?
SeedFu.seed

# GENERATE SUCCESS STORY Content
load './db/seeds/success_stories.rb'

# GENERATE test projects
load './db/seeds/test_project_submissions.rb'

# GENERATE accounts with admin privileges for testing
load './db/seeds/test_admins.rb'

# UPDATES projects_count and lessons_count after db is seeded
Course.find_each do |course|
  course.update(projects_count: course.lessons.where(is_project: true).count, lessons_count: course.lessons.where(is_project: false).count)
end
