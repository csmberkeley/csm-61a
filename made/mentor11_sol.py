>>> async def sleepy(a):
        await asyncio.sleep(a)
        await asyncio.sleep(a-1)
>>> async def sleepy2(b):
        await asyncio.gather(sleepy(b), sleepy(b-1))
>>> asyncio.run(sleepy2(5))
9

asyncio.gather() runs the arguments concurrently, so the total time this takes to run will just be the longest coroutine call. 
sleepy(5) will take 5 + 4 seconds to run (since the asyncio.sleep() calls are in sequence/not in a gather call), 
while sleepy(4) will take 4 + 3 seconds to run. So the total time taken will be 4 + 5 = 9 seconds.

(This is a new question! Please let us know if this answer seems wrong!)



    import asyncio

    async def make_task(name: str, delay: float):
        '''
        Simulates a breakfast task by waiting for a delay period of time.  
        '''
        print(f'Starting: {name}')
        await asyncio.sleep(delay)
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
        results = await asyncio.gather(make_task('Toast', 2.0), make_task('Coffee', 1.0))
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


(define (hailstone seed n)
    (if (= n 0)
        seed
        (if (= 0 (remainder seed 2))
            (hailstone
            (quotient seed 2)
            (- n 1))
          (hailstone
          (+ 1 (* seed 3))
          (- n 1)))))

; Alternative solution with cond

(define (hailstone seed n)
    (cond 
        ((= n 0) seed)
        ((= 0 (remainder seed 2))
          (hailstone
          (quotient seed 2)
          (- n 1)))
        (else 
          (hailstone
          (+ 1 (* seed 3))
          (- n 1)))))
def hailstone(seed, n):
    if n == 0:
        return seed
    if seed % 2 == 0:
        return hailstone(seed//2, n - 1)
    else:
        return hailstone(3*seed + 1, n - 1)


(define (apply-multiple f n x)
    (if (= n 0)
        x
        (f (apply-multiple f (- n 1) x))))
(define (apply-multiple f n x)
    (if (= n 0)
        x
        (apply-multiple f (- n 1) (f x))))


