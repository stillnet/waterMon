now = new Date();

console.log(fmtMSS(process.argv[2]))

function fmtMSS(s){return(s-(s%=60))/60+(9<s?':':':0')+s}

