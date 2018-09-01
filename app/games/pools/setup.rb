# frozen_string_literal: true
module Pools
  class Setup < ::Service
    def call
      JSON.dump({
        players: {
          current: 1,
          order: [{
            id: 1,
            hand: [1, 2, 3],
            deck: [1, 2, 3],
            hold: [1, 2, 3],
            discard: [1, 2, 3],
          }],
        },
        pools: {
          hold: [1, 2, 3]
        }
      })
    end
  end
end
