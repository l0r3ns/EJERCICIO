package ejercicio20;
/*
 * Lorenzo Martínez Abelleira
 * 19/11/2026
 * Crear tabla de multiplicar
 */
import java.util.Scanner;

public class ejercicio20 {

	public static void main(String[] args) {
		Scanner teclado = new Scanner(System.in);
		System.out.println("Escribe el numero para calcular su tabla de multiplicar: ");
		int num=teclado.nextInt();
		tablas(num);

	}
	public static void tablas(int a) {
		final int Lim=10;
		int num[];
		num= new int[Lim];
		for(int i=0;i<Lim;i++) {
			num[i]=a*(i+1);
			System.out.println(a+" * "+(i+1)+" = "+num[i]);
		}
	}
}
