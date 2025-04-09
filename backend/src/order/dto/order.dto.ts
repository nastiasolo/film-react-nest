export class OrderDTO {
  tickets: {
    film: string;
    session: string;
    row: number;
    seat: number;
    price: string;
  }[];

  email: string;
  phone: string;
}
