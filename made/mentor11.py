>>> async def sleepy(a):
        await asyncio.sleep(a)
        await asyncio.sleep(a-1)
>>> async def sleepy2(b):
        await asyncio.gather(sleepy(b), sleepy(b-1))
>>> asyncio.run(sleepy2(5))


    import asyncio

    async def make_task(name: str, delay: float):
        '''
        Simulates a breakfast task by waiting for a delay period of time. 
        '''
        print(f'Starting: {name}')
        await asyncio.___(___)
        print(f'Finished: {name}')
        return f'{name} is ready'
    async def main():
        '''
        Runs both breakfast tasks concurrently.
        
        >>> asyncio.run(main())
        Making breakfast...
        Starting: Toast
        Starting: Coffee
        Finished: Coffee
        Finished: Toast
        Breakfast is ready: ['Toast is ready', 'Coffee is ready']
        '''
        print('Making breakfast...')
        results = await asyncio._____(make_task(____,____), make_task(____, _____))
        print(f'Breakfast is ready: {results}')


scm> 3.14
scm> pi
scm> (define pi 3.14)
scm> pi
scm> 'pi
scm> (+ 1 2)
scm> (+ 1 (* 3 4))
scm> (if 2 3 4)
scm> (if 0 3 4)
scm> (- 5 (if #f 3 4))
scm> (if nil 3 4)
scm> (if (= 1 1) 'hello 'goodbye)
scm> (define (factorial n)
        (if (= n 0)
            1
            (* n (factorial (- n 1)))))
scm> (factorial 5)
scm> (= 2 3)
scm> (= '() '())
scm> (eq? '() '())
scm> (eq? nil nil)
scm> (eq? '() nil)
scm> (pair? (cons 1 2))
scm> (list? (cons 1 2))


; The hailstone sequence starting at seed = 10 would be
; 10 => 5 => 16 => 8 => 4 => 2 => 1

; Doctests
> (hailstone 10 0)
10
> (hailstone 10 1)
5
> (hailstone 10 2)
16
> (hailstone 5 1)
16

(define (hailstone seed n)

    (if (___________)

        ____________

        (if (___________(___________________________))

            (___________

                (____________________)

                (____________________)
            )

            (___________

                (+ ____ (* ___________))

                (__________)
            )
        )
    )
)
def hailstone(seed, n):
    if n == 0:
        return seed
    if seed % 2 == 0:
        return hailstone(seed//2, n - 1)
    else:
        return hailstone(3*seed + 1, n - 1)


;doctests
scm> (apply-multiple (lambda (x) (* x x)) 3 2)
256
scm> (apply-multiple (lambda (x) (+ x 1)) 10 1)
11
scm> (apply-multiple (lambda (x) (* 1000 x)) 0 5)
5


(define (apply-multiple f n x)


	  _________________________________
	  
	  _________________________________
	  
	  _________________________________
	  

)


