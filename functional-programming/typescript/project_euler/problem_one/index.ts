/**
 * @author { @Override  }
 * @since 20251124 : @23:49
 **/

/**
 * --------
 * Problem:
 * --------
 *  If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6, and 9. The sum of these multiples = 23
 *  
 *  Proposition: Find the sum of all the multiples of 3 or 5 below 1000.
 *
 *  Constraints: 0 <= n <= 1000
 * --------
 **/

type MultiplesOfThreeOrFive = (n: number) => boolean;

const multiplesOfThreeOrFive: MultiplesOfThreeOrFive = (n: number): boolean => n % 3 === 0 || n % 5 === 0;

/**
const sumOfMultiplesOfThreeOrFive: number = (n) => {
  let sum: number = 0;
  for (let i: number = 1; i <= n; i++) {
    if (multiplesOfThreeOrFive(i)) {
      sum += i;
    }
  }
  return sum;
}

**/


console.log(multiplesOfThreeOrFive(1000));

