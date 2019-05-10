# frozen_string_literal: true

namespace :deploy do
  desc "Runs rake db:seed"
  task :seed do
    on primary :db do
      within current_path do
        with rails_env: fetch(:stage) do
          execute :rake, "db:seed"
        end
      end
    end
  end
end
after "deploy:migrate", "deploy:seed"
