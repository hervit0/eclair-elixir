// Top solution in C# according to the leatherboard

using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.IO;

class Iroha
{
    public Iroha() { }
    public static int Main()
    {
        new Iroha().calc();
        return 0;
    }

    Scanner cin;

    void calc()
    {
        cin = new Scanner();
        int N = cin.nextInt();

        long BASE = (long)1e9;

        long[] p = cin.ArrayLong(N);
        long[] x = cin.ArrayLong(N, BASE);

        int M = cin.nextInt();
        int[] y = cin.ArrayInt(M);
        int[] r = cin.ArrayInt(M);

        
        long[] s = new long[M];
        long[] g = new long[M];
        for (int i = 0; i < M; i++)
        {
            s[i] = BASE + y[i] - r[i];
            g[i] = BASE + y[i] + r[i];
        }
        long ans = 0;

        long[] add = new long[M];
        Heap<long> h = new Heap<long>();
        for (int i = 0; i < N; i++)
        {
            h.push((x[i] << 30) + p[i] + M);
        }
        for (int i = 0; i < M; i++)
        {
            h.push((s[i] << 30) + i);
            h.push((g[i] << 30) + 0x3FFFFFFF - i);
        }

        int num = 0;
        long last = 0;

        while(h.top != null)
        {
            long now = h.pop();
            long id = now & 0x3FFFFFFF;
            if(id < M)
            {
                num++;
                last += id;
                //Console.WriteLine("find " + id);
            }
            else if(id > 0x3FFFFFFF - M)
            {
                long dec = 0x3FFFFFFF - id;
                last -= dec;
                num--;
                //Console.WriteLine("exit " + dec);
            }
            else
            {
                long pp = (id - M);
                //Console.WriteLine("pp " + pp);
                if (num == 0)
                {
                    ans += pp;
                }
                else if(num == 1)
                {
                    add[(int)last] += pp;
                }
            }
        }

        long best = 0;
        for (int i = 0; i < M; i++)
        {
            best = Math.Max(best, add[i]);
        }
        //Console.WriteLine(best);
        ans += best;
        Console.WriteLine(ans);
    }
}

class Heap<T> where T : IComparable
{
    public HeapNode<T> top;

    public Heap() { }

    public void push(T val)
    {
        top = HeapNode<T>.meld(top, new HeapNode<T>(val));
    }

    public T pop()
    {
        T ret = top.val;
        top = HeapNode<T>.meld(top.r, top.l);
        return ret;
    }

    public void merge(Heap<T> h2)
    {
        top = HeapNode<T>.meld(top, h2.top);
    }

    public class HeapNode<NT> where NT : IComparable
    {
        public HeapNode<NT> l, r;
        public NT val;

        public HeapNode(NT _val)
        {
            val = _val;
        }

        public static HeapNode<NT> meld(HeapNode<NT> a, HeapNode<NT> b)
        {
            if (a == null) return b;
            if (b == null) return a;
            if (a.val.CompareTo(b.val) > 0)
            {
                HeapNode<NT> temp = a;
                a = b;
                b = temp;
            }
            a.r = meld(a.r, b);
            HeapNode<NT> temph = a.l;
            a.l = a.r;
            a.r = temph;
            return a;
        }
    }
}


class Scanner
{
    string[] s;
    int i;

    char[] cs = new char[] { ' ' };

    public Scanner()
    {
        s = new string[0];
        i = 0;
    }

    public string next()
    {
        if (i < s.Length) return s[i++];
        string st = Console.ReadLine();
        while (st == "") st = Console.ReadLine();
        s = st.Split(cs, StringSplitOptions.RemoveEmptyEntries);
        if (s.Length == 0) return next();
        i = 0;
        return s[i++];
    }

    public int nextInt()
    {
        return int.Parse(next());
    }
    public int[] ArrayInt(int N, int add = 0)
    {
        int[] Array = new int[N];
        for (int i = 0; i < N; i++)
        {
            Array[i] = nextInt() + add;
        }
        return Array;
    }

    public long nextLong()
    {
        return long.Parse(next());
    }

    public long[] ArrayLong(int N, long add = 0)
    {
        long[] Array = new long[N];
        for (int i = 0; i < N; i++)
        {
            Array[i] = nextLong() + add;
        }
        return Array;
    }

    public double nextDouble()
    {
        return double.Parse(next());
    }


    public double[] ArrayDouble(int N, double add = 0)
    {
        double[] Array = new double[N];
        for (int i = 0; i < N; i++)
        {
            Array[i] = nextDouble() + add;
        }
        return Array;
    }
}
