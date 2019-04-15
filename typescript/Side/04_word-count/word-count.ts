class Words {
    
    count(words: string) {
        let wordMap = new Map<string, number>();
        words.trim().replace(/\s+/g, ` `).split(` `).forEach(function (word) {
            let lowercased = word.toLowerCase();
            if (wordMap.has(lowercased)) {
                let value = wordMap.get(lowercased)! + 1; 
                wordMap.set(lowercased, value);
            } else {
                wordMap.set(lowercased, 1);
            }
        });       

        return wordMap;
    }

}

export default Words