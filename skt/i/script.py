#!/usr/bin/python

def load_data(uri, dateFormat):
    logging.info('loading data; uri: {0}'.format(uri))
    
    from urllib2 import urlopen
    from csv import DictReader
    
    reader = DictReader(urlopen(uri).readlines())
    
    encodedFieldNames = []
    for fieldname in reader.fieldnames:
        encodedFieldNames.append(fieldname.decode("utf-8-sig").encode("utf-8"))
    reader.fieldnames = encodedFieldNames
    
    data = []
    
    from time import strptime
    
    for row in reader:
        data.append({
            'date': strptime(row['Date'], dateFormat),
            'open': float(row['Open']),
            'close': float(row['Close']),
            'high': float(row['High']),
            'low': float(row['Low']),
            'volume': float(row['Volume'])
        })
    
    return data

def get_typical_price(data, t):
    return (data[t]['high'] + data[t]['low'] + data[t]['close']) / 3.0

def get_money_flow(data, t):
    return get_typical_price(data, t) * data[t]['volume']

def get_positive_money_flow(data, t, i):
    if get_typical_price(data, t) > get_typical_price(data, t - i):
        return get_money_flow(data, t)
    return 0

def get_negative_money_flow(data, t, i):
    if get_typical_price(data, t) < get_typical_price(data, t - i):
        return get_money_flow(data, t)
    return 0

def get_positive_money_flow_total(data, t, n):
    total = 0
    for i in range(n):
        total += get_positive_money_flow(data, t, i)
    return total

def get_negative_money_flow_total(data, t, n):
    total = 0
    for i in range(n):
        total += get_negative_money_flow(data, t, i)
    return total

def get_money_ratio(data, t, n):
    return get_positive_money_flow_total(data, t, n) / get_negative_money_flow_total(data, t, n)

def get_mfi(data, t, n):
    return 100 - 100 / (1 + get_money_ratio(data, t, n))

def get_mfi_strategy(data):
    mfi = get_mfi(data, len(data) - 1, len(data))
    if mfi < 20:
        return {'mfi': mfi, 'strategy': 'buy'}
    elif mfi > 80:
        return {'mfi': mfi, 'strategy': 'sell'}

def process_data(data, year):
    logging.info('processing data; year: {0}'.format(year))
    res = {'open': 0, 'close': 0, 'high': 0, 'low': 0}
    typicalPrice = []
    for row in data:
        if row['date'].tm_year == year:
            res['open'] += row['open']
            res['close'] += row['close']
            res['high'] += row['high']
            res['low'] += row['low']
        
    if len(data) != 0:
        for (key, value) in res.items():
            res[key] /= len(data)

    return res

if __name__ == '__main__':
    print('Data processor 0.2')
    
    import sys
    import argparse
    import logging
    
    argparser = argparse.ArgumentParser()
    argparser.add_argument("--symbol", help="stock symbol")
    argparser.add_argument("--file", help="file to process by program")
    argparser.add_argument("--out", help="output file")
    argparser.add_argument("--logfile", help="log file")
    argparser.add_argument("--log", help="log level")
    argparser.add_argument("--year", help="year")
    argparser.add_argument("--mfi", help="money flow count")
    argparser.add_argument("--level", help="mfi level")
    args = argparser.parse_args()

    ostream = sys.stdout   
    
    try:
        if args.log:
            numeric_level = getattr(logging, args.log.upper(), None)
            
            if not isinstance(numeric_level, int):
                raise ValueError('Invalid log level: %s' % args.log)
            
            logging.basicConfig(filename=args.logfile, level=numeric_level)
        
        if args.out:
            ostream = open(args.out, 'w')
        else:
            ostream = sys.stdout
        
        if args.year:
            args.year = int(args.year)
            from datetime import MAXYEAR
            if args.year > MAXYEAR:
                args.year = MAXYEAR
        else:
            args.year = 1900
        
        uri = None
        
        if args.file:
            from os import path
            uri = 'file://' + path.abspath(args.file)
            dateFormat = '%Y-%m-%d'
        elif args.symbol:
            from datetime import date
            from urllib2 import quote
            start = date(args.year, 1, 1)
            end = date(args.year, 12, 31)
            uri = 'http://www.google.com/finance/historical?q={0}&startdate={1}&enddate={2}&output=csv'
            uri = uri.format(args.symbol.upper(), quote(start.strftime('%b %d, %Y')), quote(end.strftime('%b %d, %Y')))
            dateFormat = '%d-%b-%y'
        
        if uri:
            data = load_data(uri, dateFormat)
        
            from json import dump
            dump(process_data(data, args.year), ostream)  
            
            if args.mfi:
                dump(get_mfi_strategy(data), ostream)
        
    except IOError as e:
        logging.error("Can't open source: {0}".format(e))
    except:
        logging.error("Bad thing happened")
        
    ostream.close()    

