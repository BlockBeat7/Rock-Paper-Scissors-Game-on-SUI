#[test_only]
module sicbogame::test_sicbo_game {
    use sui::test_scenario::{Self as ts, next_tx};
    use sui::test_utils::{assert_eq};
    use std::vector;
    use sui::event;
    use sui::tx_context::{ TxContext};
    use std::string;
    use sicbogame::random;

    use sicbogame::sicbogame::{Self, create_game};

    const ADMIN: address = @0xA;
    const TEST_ADDRESS1: address = @0xB;
    const TEST_ADDRESS2: address = @0xC;

    public fun init_test_helper() : ts::Scenario{
       let owner: address = @0xA;
       let scenario_val = ts::begin(owner);
       let scenario = &mut scenario_val;
 
       scenario_val
    }

    #[test]
    public fun test_game() {
        let scenario_test = init_test_helper();
        let scenario = &mut scenario_test;

         // TEST_ADDRESS1 had created an kiosk
        next_tx(scenario, TEST_ADDRESS1);
        {
            create_game(0, ts::ctx(scenario));
        };

        next_tx(scenario, TEST_ADDRESS1);
        {
            create_game(1, ts::ctx(scenario));
        };

        next_tx(scenario, TEST_ADDRESS1);
        {
            create_game(2, ts::ctx(scenario));
        };

        next_tx(scenario, TEST_ADDRESS1);
        {
            create_game(3, ts::ctx(scenario));
        };
       
        ts::end(scenario_test);
    }















}