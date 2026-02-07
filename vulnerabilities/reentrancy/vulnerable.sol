# Reentrancy — Vulnerable Example
#
# Invariant violated:
# State must be updated BEFORE any external interaction.
#
# Failure mechanism:
# Reenter — external call happens before balance update.

func withdraw{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    amount: felt
):
    alloc_locals

    let (balance) = balances.read(caller_address)

    assert balance >= amount

    # ❌ EXTERNAL CALL BEFORE STATE UPDATE
    let success = call_contract(
        to=caller_address,
        function_selector=WITHDRAW_SELECTOR,
        calldata=[amount]
    )

    # ❌ STATE UPDATE HAPPENS TOO LATE
    balances.write(caller_address, balance - amount)

    return ()
end
