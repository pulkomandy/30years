-- Generate texture for a twister using 16 lines high blocks
-- It looks like this:
--           I      J      K      L
--           |      |      |      |
--           |     |      |       |
--            |    |     |       |
--            |   |     |       |

sides = 2; -- for a square, 3 for an exagon
lines = 34 * 16 - 1
for line = 0,lines,1 do
	alpha = (2*(line+1)*math.pi)/(sides*lines)

	j = 56 + math.sin(alpha) * 28
	k = 56 + math.sin(alpha + math.pi/sides) * 28
	l = 56 + math.sin(alpha + 2*math.pi/sides) * 28
	m = 56 + math.sin(alpha + 3*math.pi/sides) * 28

	putpicturepixel(j, line, 1)
	putpicturepixel(k, line, 2)
	putpicturepixel(l, line, 3)
	putpicturepixel(m, line, 4)
end
