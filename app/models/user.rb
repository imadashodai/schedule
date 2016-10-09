class User < ApplicationRecord
	extend Enumerize
	enumerize :status_id, in: {ok: 1, ng: 2, unknown: 0}, default: :ok
end
