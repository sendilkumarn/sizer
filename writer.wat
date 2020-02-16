(module
        (import "wasi_unstable" "fd_write" (func $fdw (param i32 i32 i32 i32) (result i32)))
        (memory 1)
        (export "memory" (memory 0))
        (data (i32.const 12) "Hooray it's WASI\n")

        (func $main (export "_start")
                (i32.store (i32.const 0) (i32.const 12))
                (i32.store (i32.const 4) (i32.const 20))
                (call $fdw
                (i32.const 1)
                (i32.const 0)
                (i32.const 1)
                (i32.const 20)
                )
                drop
        )
)
