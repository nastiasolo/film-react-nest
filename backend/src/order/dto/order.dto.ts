export class OrderDTO {
  tickets: {
    film: string;
    session: string;
    row: number;
    seat: number;
    price: number;
  }[];

  email: string;
  phone: string;
}
