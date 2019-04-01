class Squares {

    // Public Properties
    
    public squareOfSum: number;
    public sumOfSquares: number;
    public difference: number;

    // Init

    constructor(side: number) {
        let squareOfSum = this.calculateSquareOfSum(side);
        let sumOfSquares = this.calculateSumOfSquares(side);

        this.squareOfSum = squareOfSum;
        this.sumOfSquares = sumOfSquares;
        this.difference = squareOfSum - sumOfSquares;
    }

    private calculateSquareOfSum(number: number) {
        let returnValue = 0;        
        for (var _i = 0; _i <= number; _i++) {
            returnValue += _i;
        }
        
        return returnValue * returnValue;
    }

    private calculateSumOfSquares(number: number) {
        let returnValue = 0;        
        for (var _i = 0; _i <= number; _i++) {
            returnValue += _i * _i;
        }
        
        return returnValue;
    }
}
  
export default Squares
  