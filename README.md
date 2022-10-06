以下の手順でRailsサーバー立ち上げることができます。


1. `git clone https://github.com/happiness-chain/rails-task.git`

2. `cd rails-task`

3. `docker-compose run web yarn install --check-files && docker-compose run web rails db:create`
4. `docker-compose up`
