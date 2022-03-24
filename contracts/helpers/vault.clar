(define-constant err-caller-must-be-owner 
                 (err u900))

(define-data-var owner 
                 principal 
                 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.wallet)

(define-data-var token-per-cycle 
                 uint 
                 u100)

(define-read-only (get-token-per-cycle)
                  (var-get token-per-cycle)) 

(define-public (set-token-per-cycle (value uint))
               (begin (asserts! (is-eq tx-sender 
                                       (var-get owner)) 
                                err-caller-must-be-owner)
                      (ok (var-set token-per-cycle 
                                   value))))