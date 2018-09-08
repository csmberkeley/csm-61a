def trail_of_treats(G):
    return trail_helper(G, 0, 0)

def trail_helper(G, x, y):
    if x == len(G) or y == len(G):
        return G[x][y]
    else:
        a = trail_helper(G, x + 1, y)
        b = trail_helper(G, x, y + 1)
        return max(a, b) + G[x][y]
