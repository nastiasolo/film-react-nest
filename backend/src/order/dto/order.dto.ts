export class OrderDTO {
  tickets: {
    film: string;
    session: string;
    row: number;
    seat: number;
  }[];

  email: string;
  phone: string;
}
