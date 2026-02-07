# Reentrancy — Fixed Example
#
# Fix:
# Update state BEFORE external interaction.

func withdraw{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    amount: felt
):
    alloc_locals

    let (balance) = balances.read(caller_address)
    assert balance >= amount

    # ✅ STATE UPDATE FIRST
    balances.write(caller_address, balance - amount)

    # ✅ EXTERNAL CALL AFTER FINAL STATE
    let success = call_contract(
        to=caller_address,
        function_selector=WITHDRAW_SELECTOR,
        calldata=[amount]
    )

    return ()
end
