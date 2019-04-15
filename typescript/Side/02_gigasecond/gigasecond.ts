class Gigasecond {

    // Constants

    private static seconds: number = 1000000000;

    // Properties

    private _date: Date;

    // Init
    
    constructor(date: Date) {
        this._date = date;
    }

    // Object Logic

    date(): Date {
        let newDate = new Date(this._date.getTime());
        let currentSeconds = newDate.getUTCSeconds();
        newDate.setUTCSeconds(currentSeconds + Gigasecond.seconds);

        return newDate;
    }

}

export default Gigasecond
