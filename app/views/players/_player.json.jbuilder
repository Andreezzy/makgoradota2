json.extract! player, :id, :nickname, :name, :lastname, :phone, :team_id, :created_at, :updated_at
json.url player_url(player, format: :json)