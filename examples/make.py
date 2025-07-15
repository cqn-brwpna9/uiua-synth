noteconv={
        'a':'`12',
        'a#':'`11',
        'b':'`10',
        'c':'`9',
        'c#':'`8',
        'd':'`7',
        'd#':'`6',
        'e':'`5',
        'f':'`4',
        'f#':'`3',
        'g':'`2',
        'g#':'`1',
        'a1':'0',
        'a#1':'1',
        'b1':'2',
        'c1':'3',
        'c#1':'4',
        'd1':'5',
        'd#1':'6',
        'e1':'7',
        'f1':'8',
        'f#1':'9',
        'g1':'10',
        'g#1':'11',
        'r':'REST'#ooh! a specal case
    }

def convert(notes, times):
    assert len(notes)==len(times)
    out=[]
    for i in range(len(notes)):
        if noteconv[notes[i]]=='REST':
            out.append(f'REST {times[i]}\n')
        out.append(f'SYN {times[i]} {noteconv[notes[i]]}\n')
    return 'SYNTH~\"synth.ua\"\nSYN=SYNTH~SYN\nREST=SYNTH~REST\n'+''.join(out[::-1])+f'join__{len(notes)}'
def strtonotes(notes):
    out=[]
    for i in notes.split(' '):
        if i not in noteconv.keys():
            print(f'{i} is not a recognized note')
            continue
        out.append(i)
    return out
ode=[
    ('e',0.5),
    ('e',0.5),
    ('f',0.5),
    ('g',0.5),
    ('g',0.5),
    ('f',0.5),
    ('e',0.5),
    ('d',0.5),
    ('c',0.5),
    ('c',0.5),
    ('d',0.5),
    ('e',0.5),
    ('e',0.5),
    ('d',0.5),
    ('d',1),
    ('e',0.5),
    ('e',0.5),
    ('f',0.5),
    ('g',0.5),
    ('g',0.5),
    ('f',0.5),
    ('e',0.5),
    ('d',0.5),
    ('c',0.5),
    ('c',0.5),
    ('d',0.5),
    ('e',0.5),
    ('d',0.5),
    ('c',0.5),
    ('c',1)
    ]
notes=[i[0] for i in ode]
times=[i[1] for i in ode]
print(convert(notes, times))